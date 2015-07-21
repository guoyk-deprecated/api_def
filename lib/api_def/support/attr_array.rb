module ApiDef::Support::AttrArray

  def self.included(mod)

    mod.class_eval do

      # Create method +name+ with +@name+ for array storage
      def self.attr_array(*names)
        names.flatten.each do |name|
          self.class_eval <<-EOF
          def #{name}
            @#{name} ||= []
          end
          EOF
        end
      end

    end

  end

end
