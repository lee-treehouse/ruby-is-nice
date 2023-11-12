# so we have these rails hooks that let us hook into before, after, around (?what's around)
# this is used by Controllers
# ActiveJob
# ActionCable
# ActiveRecord


class Thing

  def do_it

# set up before_action, prepend_before_action, skip_before_action, etc.
      # for each of before, after, and around.
      [:before, :after, :around].each do |callback|
        define_method "#{callback}_action" do |*names, &blk|
          _insert_callbacks(names, blk) do |name, options|
            set_callback(:process_action, callback, name, options)
          end
        end

        define_method "prepend_#{callback}_action" do |*names, &blk|
          _insert_callbacks(names, blk) do |name, options|
            set_callback(:process_action, callback, name, options.merge(prepend: true))
          end
        end

        # Skip a before, after or around callback. See _insert_callbacks
        # for details on the allowed parameters.
        define_method "skip_#{callback}_action" do |*names|
          _insert_callbacks(names) do |name, options|
            skip_callback(:process_action, callback, name, options)
          end
        end

        # *_action is the same as append_*_action
        alias_method :"append_#{callback}_action", :"#{callback}_action"
      end
  end
end