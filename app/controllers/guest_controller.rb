require 'mongo'
include Mongo

require 'uri'

class GuestController < ApplicationController
  def db
    mongo_uri = ENV['MONGOLAB_URI']

    if !mongo_uri.nil?
      db_name = mongo_uri[%r{/([^/\?]+)(\?|$)}, 1]
      client = MongoClient.from_uri(mongo_uri)
    else
      client = MongoClient.new('localhost', 27017);
    end
    client.db(db_name)
  end

  def enter
    DiningPartnersWeb::Application.config.guests = 1
    guests = 1
    # guests = db['guests']
    #
    # guest['guest'] = {'count' => 1}
    # guests.save
    render text: 'entered'
  end

  def leave
    DiningPartnersWeb::Application.config.guests = 0
    # guests = db['guests']
    #
    # guest['guest'] = {'count' => 0}
    # guests.save
    #
    render text: 'left'
  end

  def list
    # guests = db['guests']
    # @have_guests = guest['guest']['count']
    @have_guests = (DiningPartnersWeb::Application.config.guests == 0)
  end
end
