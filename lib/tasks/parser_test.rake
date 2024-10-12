namespace :parser do
  desc 'Generate all test for Card::Parser from database'
  task all: :environment do
    Rake::Task['parser:character'].invoke
    Rake::Task['parser:event'].invoke
    Rake::Task['parser:stage'].invoke
    Rake::Task['parser:leader'].invoke
  end

  desc 'Generate test for Character::Parser from database'
  task character: :environment do
    Rails.root.glob('test/models/card/character/*_test.{rb}').each do |file|
      File.delete(file)
    end

    Card::Codeable::SERIES.each_key do |series|
      characters = Character.from_series(series)
      next if characters.empty?

      test_file = "#{Rails.root}/test/models/card/character/#{series.underscore}_test.rb"
      File.open(test_file, 'a+') do |f|
        f.puts <<~RUBY
          require 'test_helper'

          class Card::Character::#{series.camelize}Test < ActiveSupport::TestCase
            EFFECT = [
              #{characters.pluck(:effect).uniq.map { |effect| "\"#{effect.gsub('"', '\"')}\"" }.join(",\n    ")}
            ].freeze

            TRIGGER = [
              #{characters.pluck(:trigger).uniq.map { |trigger| "\"#{trigger.gsub('"', '\"')}\"" }.join(",\n    ")}
            ].freeze

            EFFECT.each do |effect|
              test "parse effect: \#{effect}" do
                skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("#{series.camelize}")
                parsed = Card::Character::Effect.parse(effect)

                assert_not_nil parsed
              end
            end

            TRIGGER.each do |trigger|
              test "parse trigger: \#{trigger}" do
                skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("#{series.camelize}")
                parsed = Card::Character::Trigger.parse(trigger)

                assert_not_nil parsed
              end
            end
          end
        RUBY
      end
    end
  end

  desc 'Generate test for Event::Parser from database'
  task event: :environment do
    Rails.root.glob('test/models/card/event/*_test.{rb}').each do |file|
      File.delete(file)
    end

    Card::Codeable::SERIES.each_key do |series|
      events = Event.from_series(series)
      next if events.empty?

      test_file = "#{Rails.root}/test/models/card/event/#{series.underscore}_test.rb"
      File.open(test_file, 'a+') do |f|
        f.puts <<~RUBY
          require 'test_helper'

          class Card::Event::#{series.camelize}Test < ActiveSupport::TestCase
            EFFECT = [
              #{events.pluck(:effect).uniq.map { |effect| "\"#{effect.gsub('"', '\"')}\"" }.join(",\n    ")}
            ].freeze

            TRIGGER = [
              #{events.pluck(:trigger).uniq.map { |trigger| "\"#{trigger.gsub('"', '\"')}\"" }.join(",\n    ")}
            ].freeze

            EFFECT.each do |effect|
              test "parse effect: \#{effect}" do
                skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("#{series.camelize}")
                parsed = Card::Event::Effect.parse(effect)

                assert_not_nil parsed
              end
            end

            TRIGGER.each do |trigger|
              test "parse trigger: \#{trigger}" do
                skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("#{series.camelize}")
                parsed = Card::Event::Trigger.parse(trigger)

                assert_not_nil parsed
              end
            end
          end
        RUBY
      end
    end
  end

  desc 'Generate test for Stage::Parser from database'
  task stage: :environment do
    Rails.root.glob('test/models/card/stage/*_test.{rb}').each do |file|
      File.delete(file)
    end

    Card::Codeable::SERIES.each_key do |series|
      stages = Stage.from_series(series)
      next if stages.empty?

      test_file = "#{Rails.root}/test/models/card/stage/#{series.underscore}_test.rb"
      File.open(test_file, 'a+') do |f|
        f.puts <<~RUBY
          require 'test_helper'

          class Card::Stage::#{series.camelize}Test < ActiveSupport::TestCase
            EFFECT = [
              #{stages.pluck(:effect).uniq.map { |effect| "\"#{effect.gsub('"', '\"')}\"" }.join(",\n    ")}
            ].freeze

            TRIGGER = [
              #{stages.pluck(:trigger).uniq.map { |trigger| "\"#{trigger.gsub('"', '\"')}\"" }.join(",\n    ")}
            ].freeze

            EFFECT.each do |effect|
              test "parse effect: \#{effect}" do
                skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("#{series.camelize}")
                parsed = Card::Stage::Effect.parse(effect)

                assert_not_nil parsed
              end
            end

            TRIGGER.each do |trigger|
              test "parse trigger: \#{trigger}" do
                skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("#{series.camelize}")
                parsed = Card::Stage::Trigger.parse(trigger)

                assert_not_nil parsed
              end
            end
          end
        RUBY
      end
    end
  end

  desc 'Generate test for Leader::Parser from database'
  task leader: :environment do
    Rails.root.glob('test/models/card/leader/*_test.{rb}').each do |file|
      File.delete(file)
    end

    Card::Codeable::SERIES.each_key do |series|
      leaders = Leader.from_series(series)
      next if leaders.empty?

      test_file = "#{Rails.root}/test/models/card/leader/#{series.underscore}_test.rb"
      File.open(test_file, 'a+') do |f|
        f.puts <<~RUBY
          require 'test_helper'

          class Card::Leader::#{series.camelize}Test < ActiveSupport::TestCase
            EFFECT = [
              #{leaders.pluck(:effect).uniq.map { |effect| "\"#{effect.gsub('"', '\"')}\"" }.join(",\n    ")}
            ].freeze

            EFFECT.each do |effect|
              test "parse effect: \#{effect}" do
                skip("Structure/Expansion set not yet available") unless expansion_set_enabled?("#{series.camelize}")
                parsed = Card::Leader::Effect.parse(effect)

                assert_not_nil parsed
              end
            end
          end
        RUBY
      end
    end
  end
end
