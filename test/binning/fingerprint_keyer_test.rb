# encoding: utf-8
require 'test_helper'
require 'string_clusterer/binning/fingerprint_keyer'

describe StringClusterer::Binning::FingerprintKeyer do
  describe '#key' do
    before do
      @names = [
        "Ricardo Néstor MARTINEZ",
        "RAMÓN ANTONIO ERLÁN",
        "Ramón Antonio Erlán",
        "Néstor Ricardo Martínez",
        "Durán Sáenz",
        "Ramón Antonio ERLAN",
        "Duran Saenz",
        "Durán Saénz",
        "Durán Saenz",
        "Ramón Antonio ERLÁN",
        "Ramón Antonio Erlan",
        "Duran Sáenz",
        "RAMON ANTONIO ERLAN",
        "RAMÓN ANTONIO ERLAN",
        "RICARDO NÉSTOR MARTÍNEZ",
      ]

      @keyer = StringClusterer::Binning::FingerprintKeyer.new
    end

    it 'returns key by fingerprint method' do
      clusters = @names.group_by { |n| @keyer.key(n) }

      assert clusters["antonio erlan ramon"]
      assert_equal [
        "RAMON ANTONIO ERLAN",
        "Ramón Antonio Erlan",
        "Ramón Antonio ERLAN",
        "RAMÓN ANTONIO ERLAN",
        "Ramón Antonio Erlán",
        "Ramón Antonio ERLÁN",
        "RAMÓN ANTONIO ERLÁN",
      ].sort, clusters["antonio erlan ramon"].sort

      assert clusters["duran saenz"]
      assert_equal [
        "Duran Saenz",
        "Durán Saenz",
        "Duran Sáenz",
        "Durán Sáenz",
        "Durán Saénz",
      ].sort, clusters["duran saenz"].sort
    end
  end
end
