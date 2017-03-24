require 'httpclient'
require "active_support"
require "active_support/core_ext"

class TeamsMessage
	def initialize(text, title=nil)
		@text = text
		@title = title
	end

	def getJson()
		msg = {}
		msg[:summary] = @summary if @summary
		msg[:title] = @title if @title
		msg[:text] = @text if @text
		msg[:themeColor] = @color if @color

		msg[:sections] = @sections if @sections
		msg[:potentialAction] = @potentialAction if @potentialAction
		return msg.to_json
	end

	def setColor(color)
		@color = color
	end

	def addActivity(text,title=nil,image=nil)
		activity = {}
		activity[:activityTitle] = title if title
		activity[:activityText] = text if text
		activity[:activityImage] = image if image

		@sections = [] unless @sections
		@sections << activity
	end

	def addFacts(title,array)
		section = {}
		section[:title] = title if title
		section[:facts] = []
		array.each { |name,value| section[:facts] << { :name => name, :value => value } }

		@sections = [] unless @sections
		@sections << section
	end

	def addImage(title,image)
		addImages(title,[image])
	end

	def addImages(title,images)
		section = {}
		section[:title] = title
		section[:images] = []
		images.each { |image| section[:images] << { :image => image } }

		@sections = [] unless @sections
		@sections << section	
	end

	def addAction(text,url)
		@potentialAction = [] unless @potentialAction
		@potentialAction << {
			:@context => 'http://schema.org',
			:@type => 'ViewAction',
			:name => text,
			:target => [url]
		}
	end

	def send(url,async=false)
		begin
			client = HTTPClient.new
			client.ssl_config.cert_store.set_default_paths
			client.ssl_config.ssl_version = :auto
			if async
				client.post_async url, getJson
			else
				client.post url, getJson
			end
		rescue Exception => e
			Rails.logger.warn("cannot connect to #{url}")
			Rails.logger.warn(e)
		end
	end
end
