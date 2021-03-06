class Contact < ActiveRecord::Base

  after_save :expire_contact_all_cache
  after_destroy :expire_contact_all_cache

  def expire_contact_all_cache
    Rails.cache.delete('Contact.all')
  end

  def self.all_cached
    Rails.cache.fetch('Contact.all') { all }
  end

end
