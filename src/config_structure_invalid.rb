class ConfigStructureInvalid < StandardError
  def initialize(msg = 'Your config structure is invalid')
    super
  end
end