class Seed

  def self.begin
    seed = Seed.new
    seed.generate_quotes
  end

  def generate_quotes
    20.times do |i|
      quote = Quote.create!(
        author: Faker::Book.author,
        quote: Faker::Movie.quote
      )
      puts "Quote #{i}: Author is #{quote.author} and quotation is '#{quote.quote}'."
    end
  end
end

Seed.begin