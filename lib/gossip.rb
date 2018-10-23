require "csv"
class Gossip
	attr_accessor :author, :content, :id
	def initialize(author = nil,content = nil,id = nil)
		@author = author
		@content = content
		@id = id
	end

	def save
  		CSV.open("./db/gossip.csv", "ab") do |csv|
   			csv << [@author, @content]
 		end
 		
 		
	end
	def self.all
		@all_gossips = []
  		CSV.read("./db/gossip.csv").each_with_index do |csv_line,key|
  		  @all_gossips << Gossip.new(csv_line[0],csv_line[1],key)
  		end
  		return  @all_gossips
	end

	def self.find(params=nil)
		@all = Array.new
  		CSV.read("./db/gossip.csv").each_with_index do |csv_line,key|
  		  if key == params.to_i then
  		  	@all << Gossip.new(csv_line[0],csv_line[1],params)
  		  end
  		end
  		return @all
	end

	def edit(params = nil)
		@all = Array.new
  		CSV.read("./db/gossip.csv").each_with_index do |csv_line,key|
  		  	@all << [csv_line[0],csv_line[1]]
  		end
  		potin = @all.to_h
		keys = potin.keys[params.to_i]
		potin[keys] = @content
		File.open("./db/gossip.csv","w") do |file|
			file.write('')
		end
	end
end