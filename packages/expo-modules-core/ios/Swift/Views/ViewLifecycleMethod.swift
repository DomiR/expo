// Copyright 2022-present 650 Industries. All rights reserved.

public enum ViewLifecycleMethodType {
  case propsChanged
}

public protocol AnyViewLifecycleMethod: AnyDefinition {
  var methodType: ViewLifecycleMethodType { get }

  func callAsFunction(_ view: UIView)
}

public final class ViewLifecycleMethod<ViewType: UIView>: AnyViewLifecycleMethod {
  public let methodType: ViewLifecycleMethodType

  internal let closure: (ViewType) -> Void

  init(type: ViewLifecycleMethodType, closure: @escaping (ViewType) -> Void) {
    self.methodType = type
    self.closure = closure
  }

  public func callAsFunction(_ view: UIView) {
    guard let view = view as? ViewType else {
      log.warn("Cannot call lifecycle method '\(methodType)', given view is not of type '\(ViewType.self)'")
      return
    }
    closure(view)
  }
}
