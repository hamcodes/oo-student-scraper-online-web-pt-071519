class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    student_hash.each do |key, value|
      instance_variable_set("@" + key.to_s, value)
    end
    @@all << self
  end

  def self.create_from_collection(students_array)
    
    end
  end

  def self.all
    @@all
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each do |key, value|
      instance_variable_set("@" + key.to_s, value)
    end
  end
end

