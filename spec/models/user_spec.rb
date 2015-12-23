require 'spec_helper'

describe User do
  describe 'i18n' do
    context 'error' do
      before do
        mock_clam_scan_response 2
        subject.avatar = File.open safe_path
        subject.valid?
      end

      it 'uses i18n' do
        expect(subject.errors.full_messages).to include('Avatar could not be processed')
      end
    end

    context 'unknown' do
      before do
        mock_clam_scan_response 4
        subject.avatar = File.open safe_path
        subject.valid?
      end

      it 'uses i18n' do
        expect(subject.errors.full_messages).to include('Avatar could not be processed')
      end
    end

    context 'unsafe' do
      before do
        subject.avatar = File.open eicar_path
        subject.valid?
      end

      it 'uses i18n' do
        expect(subject.errors.full_messages).to include('Avatar could not be accepted')
      end
    end
  end

  describe 'validation' do
    context 'error scanning' do
      before do
        mock_clam_scan_response 2
        subject.avatar = File.open safe_path
      end

      it 'is not valid' do
        expect(subject).not_to be_valid
      end
    end

    context 'nothing is uploaded' do
      it 'is valid' do
        expect(subject).to be_valid
      end
    end

    context 'safe file is uploaded' do
      before do
        subject.avatar = File.open safe_path
      end

      it 'is valid' do
        expect(subject).to be_valid
      end
    end

    context 'unknown clamav response' do
      before do
        mock_clam_scan_response 4
        subject.avatar = File.open safe_path
      end

      it 'is not valid' do
        expect(subject).not_to be_valid
      end
    end

    context 'unsafe file is uploaded' do
      before do
        subject.avatar = File.open eicar_path
      end

      it 'is not valid' do
        expect(subject).not_to be_valid
      end
    end
  end
end
