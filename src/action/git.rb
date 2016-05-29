require 'minigit'

class Git
  def checkout_branch(repository)
    puts '** Git: **'
    @git_client = MiniGit.new(repository.local_path)
    @git_client.fetch
    @git_client.checkout(repository.branch_name)
    @git_client.pull
    puts 'Git finished'
  end
end