// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library display.mojom;

import 'dart:async';

import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojom/mojo/context_provider.mojom.dart' as context_provider_mojom;
import 'package:mojom/mojo/viewport_parameter_listener.mojom.dart' as viewport_parameter_listener_mojom;
import 'package:mojom/mojo/surfaces.mojom.dart' as surfaces_mojom;


class DisplaySubmitFrameParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  surfaces_mojom.Frame frame = null;

  DisplaySubmitFrameParams() : super(kVersions.last.size);

  static DisplaySubmitFrameParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static DisplaySubmitFrameParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DisplaySubmitFrameParams result = new DisplaySubmitFrameParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.frame = surfaces_mojom.Frame.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(frame, 8, false);
  }

  String toString() {
    return "DisplaySubmitFrameParams("
           "frame: $frame" ")";
  }
}

class DisplaySubmitFrameResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  DisplaySubmitFrameResponseParams() : super(kVersions.last.size);

  static DisplaySubmitFrameResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static DisplaySubmitFrameResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DisplaySubmitFrameResponseParams result = new DisplaySubmitFrameResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "DisplaySubmitFrameResponseParams("")";
  }
}

class DisplayFactoryCreateParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  Object contextProvider = null;
  Object returner = null;
  Object displayRequest = null;

  DisplayFactoryCreateParams() : super(kVersions.last.size);

  static DisplayFactoryCreateParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static DisplayFactoryCreateParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DisplayFactoryCreateParams result = new DisplayFactoryCreateParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.contextProvider = decoder0.decodeServiceInterface(8, false, context_provider_mojom.ContextProviderProxy.newFromEndpoint);
    }
    if (mainDataHeader.version >= 0) {
      
      result.returner = decoder0.decodeServiceInterface(16, true, surfaces_mojom.ResourceReturnerProxy.newFromEndpoint);
    }
    if (mainDataHeader.version >= 0) {
      
      result.displayRequest = decoder0.decodeInterfaceRequest(24, false, DisplayStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInterface(contextProvider, 8, false);
    
    encoder0.encodeInterface(returner, 16, true);
    
    encoder0.encodeInterfaceRequest(displayRequest, 24, false);
  }

  String toString() {
    return "DisplayFactoryCreateParams("
           "contextProvider: $contextProvider" ", "
           "returner: $returner" ", "
           "displayRequest: $displayRequest" ")";
  }
}

const int kDisplay_submitFrame_name = 0;

const String DisplayName =
      'mojo::Display';

abstract class Display {
  Future<DisplaySubmitFrameResponseParams> submitFrame(surfaces_mojom.Frame frame,[Function responseFactory = null]);

}


class DisplayProxyImpl extends bindings.Proxy {
  DisplayProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  DisplayProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  DisplayProxyImpl.unbound() : super.unbound();

  static DisplayProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new DisplayProxyImpl.fromEndpoint(endpoint);

  String get name => DisplayName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kDisplay_submitFrame_name:
        var r = DisplaySubmitFrameResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "DisplayProxyImpl($superString)";
  }
}


class _DisplayProxyCalls implements Display {
  DisplayProxyImpl _proxyImpl;

  _DisplayProxyCalls(this._proxyImpl);
    Future<DisplaySubmitFrameResponseParams> submitFrame(surfaces_mojom.Frame frame,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new DisplaySubmitFrameParams();
      params.frame = frame;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kDisplay_submitFrame_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class DisplayProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Display ptr;
  final String name = DisplayName;

  DisplayProxy(DisplayProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _DisplayProxyCalls(proxyImpl);

  DisplayProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new DisplayProxyImpl.fromEndpoint(endpoint) {
    ptr = new _DisplayProxyCalls(impl);
  }

  DisplayProxy.fromHandle(core.MojoHandle handle) :
      impl = new DisplayProxyImpl.fromHandle(handle) {
    ptr = new _DisplayProxyCalls(impl);
  }

  DisplayProxy.unbound() :
      impl = new DisplayProxyImpl.unbound() {
    ptr = new _DisplayProxyCalls(impl);
  }

  static DisplayProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new DisplayProxy.fromEndpoint(endpoint);

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "DisplayProxy($impl)";
  }
}


class DisplayStub extends bindings.Stub {
  Display _impl = null;

  DisplayStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  DisplayStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  DisplayStub.unbound() : super.unbound();

  static DisplayStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new DisplayStub.fromEndpoint(endpoint);

  static const String name = DisplayName;


  DisplaySubmitFrameResponseParams _DisplaySubmitFrameResponseParamsFactory() {
    var result = new DisplaySubmitFrameResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kDisplay_submitFrame_name:
        var params = DisplaySubmitFrameParams.deserialize(
            message.payload);
        return _impl.submitFrame(params.frame,_DisplaySubmitFrameResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kDisplay_submitFrame_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  Display get impl => _impl;
  set impl(Display d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "DisplayStub($superString)";
  }

  int get version => 0;
}

const int kDisplayFactory_create_name = 0;

const String DisplayFactoryName =
      'mojo::DisplayFactory';

abstract class DisplayFactory {
  void create(Object contextProvider, Object returner, Object displayRequest);

}


class DisplayFactoryProxyImpl extends bindings.Proxy {
  DisplayFactoryProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  DisplayFactoryProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  DisplayFactoryProxyImpl.unbound() : super.unbound();

  static DisplayFactoryProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new DisplayFactoryProxyImpl.fromEndpoint(endpoint);

  String get name => DisplayFactoryName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "DisplayFactoryProxyImpl($superString)";
  }
}


class _DisplayFactoryProxyCalls implements DisplayFactory {
  DisplayFactoryProxyImpl _proxyImpl;

  _DisplayFactoryProxyCalls(this._proxyImpl);
    void create(Object contextProvider, Object returner, Object displayRequest) {
      assert(_proxyImpl.isBound);
      var params = new DisplayFactoryCreateParams();
      params.contextProvider = contextProvider;
      params.returner = returner;
      params.displayRequest = displayRequest;
      _proxyImpl.sendMessage(params, kDisplayFactory_create_name);
    }
  
}


class DisplayFactoryProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  DisplayFactory ptr;
  final String name = DisplayFactoryName;

  DisplayFactoryProxy(DisplayFactoryProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _DisplayFactoryProxyCalls(proxyImpl);

  DisplayFactoryProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new DisplayFactoryProxyImpl.fromEndpoint(endpoint) {
    ptr = new _DisplayFactoryProxyCalls(impl);
  }

  DisplayFactoryProxy.fromHandle(core.MojoHandle handle) :
      impl = new DisplayFactoryProxyImpl.fromHandle(handle) {
    ptr = new _DisplayFactoryProxyCalls(impl);
  }

  DisplayFactoryProxy.unbound() :
      impl = new DisplayFactoryProxyImpl.unbound() {
    ptr = new _DisplayFactoryProxyCalls(impl);
  }

  static DisplayFactoryProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new DisplayFactoryProxy.fromEndpoint(endpoint);

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "DisplayFactoryProxy($impl)";
  }
}


class DisplayFactoryStub extends bindings.Stub {
  DisplayFactory _impl = null;

  DisplayFactoryStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  DisplayFactoryStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  DisplayFactoryStub.unbound() : super.unbound();

  static DisplayFactoryStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new DisplayFactoryStub.fromEndpoint(endpoint);

  static const String name = DisplayFactoryName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kDisplayFactory_create_name:
        var params = DisplayFactoryCreateParams.deserialize(
            message.payload);
        _impl.create(params.contextProvider, params.returner, params.displayRequest);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  DisplayFactory get impl => _impl;
  set impl(DisplayFactory d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "DisplayFactoryStub($superString)";
  }

  int get version => 0;
}


