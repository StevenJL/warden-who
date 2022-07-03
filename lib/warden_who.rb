require "warden"
require "redis"

module Warden
  module Who
    @@warden_who_cache = nil

    def self.check_in(model, id)
      @@warden_who_cache.sadd("devise-who-#{model}", id)
    end

    def self.check_out(model, id)
      @@warden_who_cache.srem("devise-who-#{model}", id)
    end

    def self.list(model)
      @@warden_who_cache.members("devise-who-#{model}")
    end

    def self.set_cache(cache)
      @@warden_who_cache = cache
    end
  end
end

Warden::Manager.after_authentication do |record, warden, opts|
  Devise::Whos.check_in!(record.class.name, record[record.class.primary_key])
end

Warden::Manager.before_logout do |record, warden, opts|
  Devise::Whos.check_out!(record.class.name, record[record.class.primary_key])
end
