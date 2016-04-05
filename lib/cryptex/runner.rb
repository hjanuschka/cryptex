module Cryptex
  class Runner
    attr_accessor :changes_to_commit

    def run(params)
      FastlaneCore::PrintTable.print_values(config: params,
                                         hide_keys: [:workspace],
                                             title: "Summary for match #{Match::VERSION}")

      #params[:workspace] = GitHelper.clone(params[:git_url], params[:shallow_clone], skip_docs: params[:skip_docs])
      TablePrinter.print_summary(params, uuid)

      UI.success "All required keys, certificates and provisioning profiles are installed 🙌".green
    ensure
      GitHelper.clear_changes
    end
  end
end
