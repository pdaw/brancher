require 'minigit'

class GitCheckout
  def checkout_branch(repository)
    @git_client = MiniGit.new(repository.local_path)
    @git_client.fetch
    @git_client.checkout(repository.branch_name)
  end
end