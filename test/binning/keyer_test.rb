require 'test_helper'
require 'string_clusterer/binning/keyer'

describe StringClusterer::Binning::Keyer do
  describe '#new' do
    it 'receives a string as parameter' do
      @keyer = StringClusterer::Binning::Keyer.new('A Lame String')
      assert @keyer
    end
  end

  describe '#string' do
    it 'returns the same string passed to #new' do
      @keyer = StringClusterer::Binning::Keyer.new('A Lame String')
      assert_equal 'A Lame String', @keyer.string
    end

    it 'changes string to be keyed' do
      @keyer = StringClusterer::Binning::Keyer.new('')
      assert @keyer.string.empty?, '#string is not empty'

      @keyer.string = 'My String'
      assert_equal 'My String', @keyer.string
    end
  end

  describe '#key' do
    before do
      @keyer = StringClusterer::Binning::Keyer.new('A Lame String')
    end

    it 'raises NotImplementedError' do
      assert_raises(NotImplementedError) { @keyer.key }
    end
  end
end
