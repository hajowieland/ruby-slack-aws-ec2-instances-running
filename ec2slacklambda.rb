require 'aws-sdk-ec2'
require 'slack-ruby-client'

def lambda_handler(event:, context:)
  Slack.configure do |config|
      config.token = ENV['SLACK_API_TOKEN']
      raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
  end

  regionslist = Aws::EC2::Client.new

  describe_regions_result = regionslist.describe_regions()

  describe_regions_result.regions.each do |region|
      ec2 = Aws::EC2::Resource.new(region: "#{region.region_name}")
      client = Slack::Web::Client.new
      if ec2.instances.count > 0
          client.chat_postMessage(channel: '#general', text: "Running Instances in *#{region.region_name}*:\n", as_user: true)
      end
      ec2.instances.each do |i|
          client.chat_postMessage(channel: '#general', text: "#{i.id} (_#{i.instance_type}_)\n", as_user: true)
      end
  end
end

