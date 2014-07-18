# okay... this isn't exactly great
# but after spending too much time looking for the perfect way to test this, it's good enough for now
# something better is welcome

class MyModel
  include ActiveModel::Validations

  attr_accessor :file
  validates :file, :virus_free => true

  def initialize (present, virus)
    @file = MyFile.new(present, virus)
  end
end

class MyFile
  def initialize (present, virus)
    @present = present
    @virus = virus
  end

  def present?
    @present
  end

  def url
    @virus ? eicar_path : safe_path
  end
end
