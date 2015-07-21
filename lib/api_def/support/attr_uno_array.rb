module ApiDef::Support::AttrUnoArray

  def self.included(mod)

    mod.class_eval do

      def self.attr_uno_array(name, opts)
        clazz = opts[:class]
        raise "Please specify a class" unless clazz
        store = opts[:store] || (name.to_s + "s")

        self.attr_array store
        self.class_eval <<-EOF

        def #{name}(value)
          obj = #{clazz}.new(value)
          yield obj if block_given?
          self.#{store} << obj
          self
        end

        EOF
      end

    end

  end

end
