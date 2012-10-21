module VagrantApache2
  module Command
  class Apache2 < Vagrant::Command::Base
      def initialize(argv, env)
        super
        @main_args, @sub_command, @sub_args = split_main_and_subcommand(argv)
      end

      def execute
        parser = OptionParser.new do |opts|
          opts.banner = I18n.t("vagrant.plugins.apache2.help.usage")
          opts.separator ""
        end

        # Parse the options
        argv = parse_options(parser)
        return if !argv

        vm_name = argv[0] if argv.length > 1
        command = argv[argv.length-1]

        if !command
          @env.ui.info(parser.help, :prefix => false)
          return
        end

        with_target_vms(vm_name) do |vm|
          if vm.state != :running
            notify :warn, I18n.t("vagrant.plugins.apache2.execute.skip", :vm_name => vm.name)
          else
            notify :info, I18n.t("vagrant.plugins.apache2.execute.executing", {:command => command, :vm_name => vm.name})
            command = "/etc/init.d/apache2 #{command}".strip
            if vm.channel.sudo(command) == 0
              notify :success, I18n.t("vagrant.plugins.apache2.execute.success", :command => command)
            else
              notify :success, I18n.t("vagrant.plugins.apache2.execute.error", :command => command)
            end
          end
        end
      end

      protected

      def notify(level, msg)
        @env.ui.send(level, msg)
      end
    end
  end
end
