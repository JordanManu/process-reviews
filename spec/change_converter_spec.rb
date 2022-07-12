require 'change_converter' 

describe ChangeGenerator do 
  let(:change_generator)  { ChangeGenerator.new }

  context 'Converting dollars' do 
    it 'converts 1 to [1]' do 
      expect(change_generator.convert(1)).to eq [1]
    end

    it 'converts 4 to [1, 1, 1, 1]' do 
      expect(change_generator.convert(4)).to eq [1, 1, 1, 1]
    end

    it 'converts 5 to [5]' do 
      expect(change_generator.convert(5)).to eq [5]
    end
    it 'converts 9 to [5, 1, 1, 1, 1]' do 
      expect(change_generator.convert(9)).to eq [5, 1, 1, 1, 1]
    end

    it 'converts 1 to [1]' do 
      expect(change_generator.convert(1)).to eq [1]
    end

    it 'converts 6 to [5, 1]' do 
      expect(change_generator.convert(6)).to eq [5, 1]
    end

    it 'converts 40 to [20, 20]' do 
      expect(change_generator.convert(40)).to eq [20, 20]
    end
  end

  context 'Converting cents' do 

    it 'converts 0.05 to [0.05]' do
      expect(change_generator.convert(0.05)).to eq [0.05]
    end

    it 'converts 0.10 to [0.10]' do
      expect(change_generator.convert(0.10)).to eq [0.10]
    end

    it 'converts 0.15 to [0.10, 0.05]' do
      expect(change_generator.convert(0.15)).to eq [0.10, 0.05]
    end

    it 'converts 0.09 to [0.05, 0.01, 0.01, 0.01, 0.01]' do
      expect(change_generator.convert(0.09)).to eq [0.05, 0.01, 0.01, 0.01, 0.01]
    end

    it 'converts 0.11 to [0.10, 0.01]' do
      expect(change_generator.convert(0.11)).to eq [0.10, 0.01]
    end
  end

  context 'Does not give out 0.01 or 0.05' do 

    it 'rounds 0.05 to 0.10' do 
      expect(change_generator.convert(0.05)).to eq [0.10]
    end

    it 'rounds 0.02 to 0.10' do 
      expect(change_generator.convert(0.02)).to eq [0.10]
    end

    it 'rounds 0.09 to 0.10' do 
      expect(change_generator.convert(0.09)).to eq [0.10]
    end
  end
end
