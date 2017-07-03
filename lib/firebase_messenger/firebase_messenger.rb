module FirebaseMessenger

  @interceptors = []
  @observers = []

  class << self
    attr_accessor :interceptors, :observers

    def register_interceptor(interceptor)
      @interceptors.push(interceptor).uniq!
    end

    def unregister_interceptor(interceptor)
      @interceptors.delete(interceptor)
    end

    def register_observer(observer)
      @observers.push(observer).uniq!
    end

    def unregister_observer(observer)
      @observers.delete(observer)
    end
  end
end
