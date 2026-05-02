require 'spec_helper'

describe 'Gemfile Phase 0-1 Update' do
  let(:gemfile_path) { File.expand_path('../../../Gemfile', __FILE__) }
  let(:gemfile_content) { File.read(gemfile_path) }

  describe 'jsbundling-rails and cssbundling-rails removal' do
    it 'does not include jsbundling-rails' do
      expect(gemfile_content).not_to include('jsbundling-rails')
    end

    it 'does not include cssbundling-rails' do
      expect(gemfile_content).not_to include('cssbundling-rails')
    end
  end

  describe 'shakapacker gem addition' do
    it 'includes shakapacker gem' do
      expect(gemfile_content).to include('shakapacker')
    end

    it 'specifies shakapacker version ~> 8.0' do
      expect(gemfile_content).to match(/gem\s+["']shakapacker["']\s*,\s*["']~>\s*8\.0["']/)
    end
  end

  describe 'tailwindcss-rails gem addition' do
    it 'includes tailwindcss-rails gem' do
      expect(gemfile_content).to include('tailwindcss-rails')
    end
  end

  describe 'new utility gems addition' do
    it 'includes validates_email_format_of gem' do
      expect(gemfile_content).to include('validates_email_format_of')
    end

    it 'includes kaminari gem' do
      expect(gemfile_content).to include('kaminari')
    end

    it 'includes ransack gem' do
      expect(gemfile_content).to include('ransack')
    end
  end

  describe 'existing gems preservation' do
    it 'preserves devise gem' do
      expect(gemfile_content).to include('devise')
    end

    it 'preserves caxlsx gem' do
      expect(gemfile_content).to include('caxlsx')
    end

    it 'preserves caxlsx_rails gem' do
      expect(gemfile_content).to include('caxlsx_rails')
    end

    it 'preserves react-rails gem' do
      expect(gemfile_content).to include('react-rails')
    end
  end

  describe 'Ruby version specification' do
    it 'specifies Ruby 3.3' do
      expect(gemfile_content).to include('ruby "~> 3.3.0"')
    end
  end

  describe 'comment organization' do
    it 'has proper comment for asset bundling' do
      expect(gemfile_content).to include('# Asset bundling')
    end

    it 'has proper comment for authentication' do
      expect(gemfile_content).to include('# Authentication')
    end

    it 'has proper comment for validation' do
      expect(gemfile_content).to include('# Validation')
    end

    it 'has proper comment for pagination search' do
      expect(gemfile_content).to include('# Pagination & Search')
    end

    it 'has proper comment for excel export' do
      expect(gemfile_content).to include('# Excel export')
    end
  end
end
