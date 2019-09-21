# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Tool, type: :model do
  describe '.pipe' do
    context 'pipe with increment' do
      let!(:increment) { Proc.new { |value| value + 1 } }
      context 'case I: pipe(5, increment)' do
        it 'returns the value: 6' do
          expect(Tool.pipe(5, increment)).to equal 6
        end
      end
      context 'case II: pipe(5, increment, increment, increment)' do
        it 'returns the value: 8' do
          expect(Tool.pipe(5, increment, increment, increment)).to equal 8
        end
      end
    end

    context 'pipe with decrement' do
      let!(:decrement) { Proc.new { |value| value - 1 } }

      context 'case I: pipe(5, decrement)' do
        it 'returns the value: 4' do
          expect(Tool.pipe(5, decrement)).to equal 4
        end
      end

      context 'case II: pipe(5, decrement, decrement, decrement)' do
        it 'returns the value: 2' do
          expect(Tool.pipe(5, decrement, decrement, decrement)).to equal 2
        end
      end
    end
  end
end
