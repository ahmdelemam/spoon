RSpec.describe 'Whenever Schedule' do
  around do |example|
    VCR.use_cassette('contentful items') do
      example.run
    end
  end

  it 'makes sure `runner` statements exist' do
    schedule = Whenever::Test::Schedule.new(file: 'config/schedule.rb')

    expect(schedule.jobs[:runner].count).to eq(1)
    expect(schedule.jobs[:runner][0][:task]).to eq('Contentful::Importer.call')
    expect(schedule.jobs[:runner][0][:every]).to eq([5.minutes])

    # Executes the actual ruby statement to make sure all constants and methods exist:
    schedule.jobs[:runner].each { |job| instance_eval job[:task] }
  end
end
