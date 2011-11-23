class Installer
    # Your command logic here

    #
    ## untar and unzip elastic search into tmp/
    #puts 'Unpacking elastic search into tmp'
    #root_path = File.expand_path(File.join(__FILE__, '..', '..', '..'))
    #elastic_search_tar_path = File.join(root_path, 'lib', 'elasticsearch-0.18.4.tar.gz')
    #tmp_path = File.join(root_path, 'tmp')
    #FileUtils.mkdir_p tmp_path unless File.directory?(tmp_path)
    #`cd #{tmp_path}; tar xzf #{elastic_search_tar_path}`
    #puts 'Elastic search unpacked successfully'
    #
    #elastic_install_path = '~/'
    #elastic_install_dir = File.expand_path(File.join(elastic_install_path, 'elasticsearch-0.18.4'))
    #puts elastic_install_dir
    #if File.exists?(elastic_install_dir)
    #  `rm -R #{tmp_path}`
    #  raise "Elastic search seems to already be installed at #{elastic_install_dir}, please run the uninstall command before continuing"
    #end
    #
    #puts "Moving elastic search to #{elastic_install_path}"
    #`mv #{tmp_path}/elasticsearch-0.18.4 #{elastic_install_path}`
    #
    #puts 'Removing the tmp directory'
    #`rm -R #{tmp_path}`

  def valid?
    @error_messages = []
    @error_messages << "Java is not installed. You must have java installed to install Elastic Search." unless java_installed?
    @error_messages << "Elastic search seems to already be installed at #{elastic_install_dir}, please run the uninstall command before continuing." if elastic_search_installed?
    @error_messages.empty?
  end

  def call

  end

  def error_messages
    @error_messages
  end

  private

  def elastic_install_dir
    File.expand_path(File.join('~', 'elasticsearch-0.18.4'))
  end

  def elastic_search_installed?
    File.exists?(elastic_install_dir)
  end

  def java_installed?
    Kernel.system('java -version')
  end
end