class Question < ApplicationRecord
  #Validations
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 9999 }
  validates :name, presence: true, length: { maximum: 100 }
  validates :address, presence: true, allow_blank: true, length: { maximum: 100 }
  VALID_TEL_REGEX =
  validates :tel, presence: true, allow_blank: true, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100}, format: { with: VALID_EMAIL_REGEX }

  #Class methods
  def self.checked_list
    return Question.where(checked: true)
  end

  def self.unchecked_list
    return Question.where(checked: false)
  end

  def self.all_check
    Question.where(checked: false).each do |q|
      q.update_attributes(checked: true)
    end
  end

  def self.all_uncheck
    Question.where(checked: true).each do |q|
      q.update_attributes(checked: false)
    end
  end

  #Instance methods

end
