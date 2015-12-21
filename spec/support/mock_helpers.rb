module MockHelpers
  def mock_clam_scan_response(exit_status)
    process_status = instance_double('Process::Status', exitstatus: exit_status)
    allow(ClamScan::Client).to receive(:scan).and_return(ClamScan::Response.new(process_status, ''))
  end
end
