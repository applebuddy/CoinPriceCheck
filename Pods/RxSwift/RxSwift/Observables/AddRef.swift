//
//  AddRef.swift
//  RxSwift
//
//  Created by Junior B. on 30/10/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

final class AddRefSink<Observer: ObserverType>: Sink<Observer>, ObserverType {
    typealias Element = Observer.Element

    override init(observer: Observer, cancel: Cancelable) {
        super.init(observer: observer, cancel: cancel)
    }

    func on(_ event: Event<Element>) {
        switch event {
        case .next:
            self.forwardOn(event)
        case .completed, .error:
            self.forwardOn(event)
            self.dispose()
        }
    }
}

final class AddRef<Element>: Producer<Element> {
    private let _source: Observable<Element>
    private let _refCount: RefCountDisposable

    init(source: Observable<Element>, refCount: RefCountDisposable) {
        self._source = source
        self._refCount = refCount
    }

    override func run<Observer: ObserverType>(_ observer: Observer, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where Observer.Element == Element {
        let releaseDisposable = self._refCount.retain()
        let sink = AddRefSink(observer: observer, cancel: cancel)
        let subscription = Disposables.create(releaseDisposable, self._source.subscribe(sink))

        return (sink: sink, subscription: subscription)
    }
}
