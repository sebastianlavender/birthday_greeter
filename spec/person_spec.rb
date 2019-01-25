require 'person'
require 'timecop'

describe Person do

  before do
    Timecop.freeze(Date.new(2019, 1, 24))
  end

  after do
    Timecop.return
  end

  subject { Person.new('dave') }
  let(:today) { double(:date)}

  describe '#name' do

    it 'should give back the players name' do
    expect(subject.name).to eq 'dave'
    end
  end

  describe '#month' do

    it 'should set the month of the persons birthday' do
      subject.set_month('4')
      expect(subject.show_month).to eq 'April'
    end
  end

  describe '#date' do

    it 'should set the date of the persons birthday' do
      subject.set_date(14)
      expect(subject.date).to eq 14
    end
  end

  describe '#is_birthday' do

    it 'should check if the dates selected are todays date' do
      subject.set_date(24)
      subject.set_month('1')
      expect(subject.is_birthday).to eq true
    end

    it 'should check if the dates selected are todays date' do
      subject.set_date(25)
      subject.set_month('1')
      expect(subject.is_birthday).to eq false
    end
  end

  describe '#days_till_birthday' do

    it 'should check how many days till birthday' do
      subject.set_date(26)
      subject.set_month('1')
      expect(subject.days_till_birthday).to eq 2
    end

    it 'should check how many days till birthday' do
      subject.set_date(23)
      subject.set_month('1')
      expect(subject.days_till_birthday).to eq 364
    end

  end

  describe '#real_date' do

     it 'should return true if the date is real' do
       subject.set_date(26)
       subject.set_month('1')
       expect(subject.real_date).to eq true
     end

     it 'should return false if the date is real' do
       subject.set_date(31)
       subject.set_month('2')
       expect(subject.real_date).to eq false
     end
  end
end
