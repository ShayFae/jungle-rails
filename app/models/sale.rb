class Sale < ActiveRecord::Base
  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

  def expired?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end
end
