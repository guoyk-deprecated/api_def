module ApiDef::Support::AttrUno

  def self.included(mod)

    mod.class_eval do

      # Create method +name+ with +name(value)+ for setter and +name+ for getter
      def self.attr_uno(*names)
        names.flatten.each do |name|
          self.class_eval <<-EOF
          def #{name}(value = nil)
            if value
              @#{name} = value
            else
              @#{name}
            end
          end
          EOF
        end
      end

    end

  end

end
