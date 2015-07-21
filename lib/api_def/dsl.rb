# ApiDef::DSL for using in spec file
module ApiDef::DSL
  def name(name)
    @name = name
  end

  def version(version)
    @version = version
  end

  def group(name, desc = nil)
    @groups ||= []
    group = ApiDef::Group.new name, desc
    yield group if block_given?
    @groups << group
  end
end
