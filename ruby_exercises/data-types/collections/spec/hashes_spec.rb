RSpec.describe 'Hashes' do
  it 'test 1' do
    # Create a new empty hash called empty
    empty = {}
    expect(empty).to eq({})
  end

  it 'test 2' do
    # Create an empty hash with a default value 0
    empty = Hash.new(0)
    expect(empty[:not_found]).to eq(0)
  end

  it 'test 3' do
    # Create a hash called ages
    ages = { "ben" => 4, "kelly" => 6 }
    expect(ages.length).to eq(2)
    expect(ages["ben"]).to eq(4)
    expect(ages["kelly"]).to eq(6)
  end

  it 'test 4' do
    # Create a hash called ages using symbols as keys
    ages = { ben: 4, kelly: 6 }
    expect(ages.length).to eq(2)
    expect(ages[:ben]).to eq(4)
    expect(ages[:kelly]).to eq(6)

    # Using another syntax
    ages = { :ben => 4, :kelly => 6 }
    expect(ages.length).to eq(2)
    expect(ages[:ben]).to eq(4)
    expect(ages[:kelly]).to eq(6)
  end

  it 'test 5' do
    # Create a hash called ingredients
    ingredients = { "tomatoes" => 3, :carrots => 7 }
    expect(ingredients["tomatoes"]).to eq(3)
    expect(ingredients[:carrots]).to eq(7)
  end

  it 'test 6' do
    # Create a hash with default values of zero
    ingredients = Hash.new(0)
    expect(ingredients["tomatoes"]).to eq(0)
    expect(ingredients[:carrots]).to eq(0)
  end

  it 'test 7' do
    books = {
      "John Steinbeck" => "Grapes of Wrath",
      "Harper Lee" => "To Kill a Mockingbird"
    }
    # Access the value "Grapes of Wrath"
    grapes = books["John Steinbeck"]
    expect(grapes).to eq("Grapes of Wrath")
  end

  it 'test 8' do
    books = {
      "John Steinbeck" => "Grapes of Wrath",
      "Harper Lee" => "To Kill a Mockingbird"
    }
    # Add a new key-value pair
    books["Ernest Hemmingway"] = "For Whom the Bell Tolls"
    expected = {
      "John Steinbeck" => "Grapes of Wrath",
      "Harper Lee" => "To Kill a Mockingbird",
      "Ernest Hemmingway" => "For Whom the Bell Tolls"
    }
    expect(books).to eq(expected)
  end

  it 'test 9' do
    books = {
      "John Steinbeck" => "Grapes of Wrath",
      "Harper Lee" => "To Kill a Mockingbird"
    }
    # Change the value associated with "John Steinbeck"
    books["John Steinbeck"] = "Of Mice and Men"
    expected = {
      "John Steinbeck" => "Of Mice and Men",
      "Harper Lee" => "To Kill a Mockingbird"
    }
    expect(books).to eq(expected)
  end

  it 'test 10' do
    books = {
      "John Steinbeck" => "Grapes of Wrath",
      "Harper Lee" => "To Kill a Mockingbird"
    }
    # Delete the key "Harper Lee"
    books.delete("Harper Lee")
    expected = {
      "John Steinbeck" => "Grapes of Wrath"
    }
    expect(books).to eq(expected)
  end

  it 'test 11' do
    books = {
      John_Steinbeck: "Grapes of Wrath",
      Harper_Lee: "To Kill a Mockingbird"
    }
    # Access the value "Grapes of Wrath"
    grapes = books[:John_Steinbeck]
    expect(grapes).to eq("Grapes of Wrath")
  end

  it 'test 12' do
    books = {
      John_Steinbeck: "Grapes of Wrath",
      Harper_Lee: "To Kill a Mockingbird"
    }
    # Add a new key-value pair
    books[:Ernest_Hemmingway] = "For Whom the Bell Tolls"
    expected = {
      John_Steinbeck: "Grapes of Wrath",
      Harper_Lee: "To Kill a Mockingbird",
      Ernest_Hemmingway: "For Whom the Bell Tolls"
    }
    expect(books).to eq(expected)
  end

  it 'test 13' do
    books = {
      John_Steinbeck: "Grapes of Wrath",
      Harper_Lee: "To Kill a Mockingbird"
    }
    # Change the value associated with :John_Steinbeck
    books[:John_Steinbeck] = "Of Mice and Men"
    expected =  {
      John_Steinbeck: "Of Mice and Men",
      Harper_Lee: "To Kill a Mockingbird"
    }
    expect(books).to eq(expected)
  end

  it 'test 14' do
    books = {
      John_Steinbeck: "Grapes of Wrath",
      Harper_Lee: "To Kill a Mockingbird"
    }
    # Delete the key :Harper_Lee
    books.delete(:Harper_Lee)
    expected = {
      John_Steinbeck: "Grapes of Wrath"
    }
    expect(books).to eq(expected)
  end

  it 'test 15' do
    ages = {
      "Jimmy" => 4,
      "Julio" => 8,
      "Juliet" => 9
    }
    # Increment Julio's age by one
    ages["Julio"] += 1
    expect(ages["Julio"]).to eq(9)
  end

  it 'test 16' do
    ages = {
      Jimmy: 4,
      Julio: 8,
      Juliet: 9
    }
    # Get an array of all the names
    names = ages.keys
    expect(names).to eq([:Jimmy, :Julio, :Juliet])
  end

  it 'test 17' do
    ages = {
      Jimmy: 4,
      Julio: 8,
      Juliet: 9
    }
    # Get an array of all the ages
    age_list = ages.values
    expect(age_list).to eq([4, 8, 9])
  end

  it 'test 18' do
    ages = {
      Jimmy: 4,
      Julio: 8,
      Juliet: 9
    }
    # Find the number of key/value pairs
    num_pairs = ages.size
    expect(num_pairs).to eq(3)
  end

  it 'test 19' do
    ages = {
      Jimmy: 4,
      Julio: 8,
      Juliet: 9
    }
    # Check if :Jimmy is a key
    jimmy_in_hash = ages.key?(:Jimmy)
    expect(jimmy_in_hash).to eq(true)

    # Check if :Jackie is in the hash
    jackie_in_hash = ages.key?(:Jackie)
    expect(jackie_in_hash).to eq(false)
  end

  it 'test 20' do
    ages = {
      Jimmy: 4,
      Julio: 8,
      Juliet: 9
    }
    # Make the keys the values and vice versa
    opposite = ages.invert
    expected = {
      4 => :Jimmy,
      8 => :Julio,
      9 => :Juliet
    }
    expect(opposite).to eq(expected)
  end
end
