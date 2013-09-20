# encoding: utf-8
require 'string_clusterer/binning/keyer'
require 'unicode_utils/downcase'

module StringClusterer
  module Binning
    class FingerprintKeyer < Keyer
      PUNCT_CTRL_RE = /\p{Punct}|\p{Cntrl}/
      SPACE_RE = /[[:space:]]+/

      TRANSLATE_PARAMS = [
        "ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽž",
        "aaaaaaaaaaaaaaaaaaccccccccccddddddeeeeeeeeeeeeeeeeeegggggggghhhhiiiiiiiiiiiiiiiiiijjkkkllllllllllnnnnnnnnnnnoooooooooooooooooorrrrrrsssssssssttttttuuuuuuuuuuuuuuuuuuuuwwyyyyyyzzzzzz"
      ]

      def key
        UnicodeUtils.downcase(@string.gsub(SPACE_RE, ' ').strip)
                    .gsub(PUNCT_CTRL_RE, '')
                    .split
                    .uniq
                    .sort
                    .join(' ')
                    .tr(*TRANSLATE_PARAMS)
      end
    end
  end
end
