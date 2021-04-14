module SpecsHelper
  class << self
    def match_specs_with_executions
      @specs = Spec.all
      executions = RunRecord.all

      exec_map = Hash.new
      # initialize with blank run records
      @specs.each { |ss| exec_map.store(ss.id, Array.new) }
      # add from existing run records
      executions.each do |ex|
        to_update = exec_map[ex.spec_id]
        to_update << ex
        exec_map.store(ex.spec_id, to_update)
      end

      out = Array.new
      @specs.each do |ss|
        run_records_for_this_spec = Array.new
        exec_map[ss.id].each {|rr| run_records_for_this_spec << rr }
        with_run_records = {
          spec: ss,
          run_records: run_records_for_this_spec
        }
        out << with_run_records
      end
      return out
    end
  end
end
