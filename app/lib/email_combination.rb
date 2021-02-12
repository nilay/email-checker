class EmailCombination

  def initialize(first_name, last_name, url)
    @first_name = first_name.downcase
    @last_name = last_name.downcase
    @url = url.downcase
  end

  def generate
    [
        first_dot_last,
        first,
        first_last,
        last_dot_first,
        first_initial_dot_last,
        first_initial_dot_last_initial
    ]
  end


  private

  def first_dot_last
    "#{@first_name}.#{@last_name}@#{@url}"
  end

  def first
    "#{@first_name}@#{@url}"
  end

  def first_last
    "#{@first_name}#{@last_name}@#{@url}"
  end

  def last_dot_first
    "#{@last_name}.#{@first_name}@#{@url}"
  end

  def first_initial_dot_last
    "#{@first_name[0]}.#{@last_name}@#{@url}"
  end

  def first_initial_dot_last_initial
    "#{@first_name[0]}.#{@last_name[0]}@#{@url}"
  end

end