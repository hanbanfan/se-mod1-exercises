RRSpec.describe 'Nested Collections' do
  it 'test 1' do
    coordinates = [[2,5],[87,2],[56,39],[3,46]]
    second = coordinates[1]

    expect(second).to eq([87, 2])
  end

  it 'test 2' do
    coordinates = [[2,5],[87,2],[56,39],[3,46]]
    thirty_nine = coordinates[2][1]

    expect(thirty_nine).to eq(39)
  end

  it 'test 3' do
    coordinates = [[2,5],[87,2],[56,39],[3,46]]
    coordinates[3] = [6, 55]

    expected = [[2,5],[87,2],[56,39],[6,55]]
    expect(coordinates).to eq(expected)
  end

  it 'test 4' do
    coordinates = [[2,5],[87,2],[56,39],[3,46]]
    coordinates[3][1] = 0

    expected = [[2,5],[87,2],[56,39],[3, 0]]
    expect(coordinates).to eq(expected)
  end

  it 'test 5' do
    coordinates = [[2,5],[87,2],[56,39],[3,46]]
    coordinates << [4, 14]

    expected = [[2,5],[87,2],[56,39],[3,46],[4, 14]]
    expect(coordinates).to eq(expected)
  end

  it 'test 6' do
    team = {
      pitchers: ["Kenny", "Joan", "Shabaz"],
      fielders: ["Luke", "Chris", "Megan", "Mark", "Mackenzie"],
      catchers: ["Johnny"]
    }
    pitchers = team[:pitchers]

    expected = ["Kenny", "Joan", "Shabaz"]
    expect(pitchers).to eq(expected)
  end

  it 'test 7' do
    team = {
      pitchers: ["Kenny", "Joan", "Shabaz"],
      fielders: ["Luke", "Chris", "Megan", "Mark", "Mackenzie"],
      catchers: ["Johnny"]
    }
    team[:pitchers] << "Phil"

    expected = {
      pitchers: ["Kenny", "Joan", "Shabaz", "Phil"],
      fielders: ["Luke", "Chris", "Megan", "Mark", "Mackenzie"],
      catchers: ["Johnny"]
    }
    expect(team).to eq(expected)
  end

  it 'test 8' do
    team = {
      pitchers: ["Kenny", "Joan", "Shabaz"],
      fielders: ["Luke", "Chris", "Megan", "Mark", "Mackenzie"],
      catchers: ["Johnny"]
    }
    team[:coaches] = []

    expected = {
      pitchers: ["Kenny", "Joan", "Shabaz"],
      fielders: ["Luke", "Chris", "Megan", "Mark", "Mackenzie"],
      catchers: ["Johnny"],
      coaches: []
    }
    expect(team).to eq(expected)
  end

  it 'test 9' do
    team = {
      pitchers: ["Kenny", "Joan", "Shabaz"],
      fielders: ["Luke", "Chris", "Megan", "Mark", "Mackenzie"],
      catchers: ["Johnny"]
    }
    num_fielders = team[:fielders].size

    expect(num_fielders).to eq(5)
  end

  it 'test 10' do
    team = {
      pitchers: ["Kenny", "Joan", "Shabaz"],
      fielders: ["Luke", "Chris", "Megan", "Mark", "Mackenzie"],
      catchers: ["Johnny"]
    }
    kenny_is_pitcher = team[:pitchers].include?("Kenny")

    expect(kenny_is_pitcher).to eq(true)
  end

  it 'test 11' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},{high: 55,low: 47,summary: "Partly Cloudy"},{high: 77,low: 64,summary: "Sunny"}], "date" => "6-21-18",ref_num: 3456789765456787656}
    actual = three_day_forecast[:ref_num]

    expect(actual).to eq(3456789765456787656)
  end

  it 'test 12' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},{high: 55,low: 47,summary: "Partly Cloudy"},{high: 77,low: 64,summary: "Sunny"}], "date" => "6-21-18",ref_num: 3456789765456787656}
    actual = three_day_forecast[:days]

    expected = [{high: 70,low: 63,summary: "Mostly Sunny"},{high: 55,low: 47,summary: "Partly Cloudy"},{high: 77,low: 64,summary: "Sunny"}]
    expect(actual).to eq(expected)
  end

  it 'test 13' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},{high: 55,low: 47,summary: "Partly Cloudy"},{high: 77,low: 64,summary: "Sunny"}], "date" => "6-21-18",ref_num: 3456789765456787656}
    actual = three_day_forecast["date"]

    expect(actual).to eq("6-21-18")
  end

  it 'test 14' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},{high: 55,low: 47,summary: "Partly Cloudy"},{high: 77,low: 64,summary: "Sunny"}], "date" => "6-21-18",ref_num: 3456789765456787656}
    actual = three_day_forecast.keys

    expect(actual).to eq([:days, "date", :ref_num])
  end

  it 'test 15' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},{high: 55,low: 47,summary: "Partly Cloudy"},{high: 77,low: 64,summary: "Sunny"}], "date" => "6-21-18",ref_num: 3456789765456787656}
    actual = three_day_forecast[:days][1][:high]

    expect(actual).to eq(55)
  end

  it 'test 16' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},{high: 55,low: 47,summary: "Partly Cloudy"},{high: 77,low: 64,summary: "Sunny"}], "date" => "6-21-18",ref_num: 3456789765456787656}
    actual = three_day_forecast[:days][0].keys

    expect(actual).to eq([:high, :low, :summary])
  end

  it 'test 17' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},{high: 55,low: 47,summary: "Partly Cloudy"},{high: 77,low: 64,summary: "Sunny"}], "date" => "6-21-18",ref_num: 3456789765456787656}
    actual = three_day_forecast[:days][2].values

    expect(actual).to eq([77, 64, "Sunny"])
  end

  it 'test 18' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},{high: 55,low: 47,summary: "Partly Cloudy"},{high: 77,low: 64,summary: "Sunny"}], "date" => "6-21-18",ref_num: 3456789765456787656}
    actual = three_day_forecast.key("6-21-18")

    expect(actual).to eq("date")
  end

  it 'test 19' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},{high: 55,low: 47,summary: "Partly Cloudy"},{high: 77,low: 64,summary: "Sunny"}], "date" => "6-21-18",ref_num: 3456789765456787656}
    three_day_forecast[:days][0][:high] = 99

    expected = {days: [{high: 99,low: 63,summary: "Mostly Sunny"},{high: 55,low: 47,summary: "Partly Cloudy"},{high: 77,low: 64,summary: "Sunny"}], "date" => "6-21-18",ref_num: 3456789765456787656}
    expect(three_day_forecast).to eq(expected)
  end

  it 'test 20' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},{high: 55,low: 47,summary: "Partly Cloudy"},{high: 77,low: 64,summary: "Sunny"}], "date" => "6-21-18",ref_num: 3456789765456787656}
    three_day_forecast["time"] = "12:30"

    expected = {"time" => "12:30", days: [{high: 70,low: 63,summary: "Mostly Sunny"},{high: 55,low: 47,summary: "Partly Cloudy"},{high: 77,low: 64,summary: "Sunny"}], "date" => "6-21-18",ref_num: 3456789765456787656}
    expect(three_day_forecast).to eq(expected)
  end
end
