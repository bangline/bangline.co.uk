class String
  def to_slug
    self.downcase.strip.gsub(' ', '-')
  end
end
