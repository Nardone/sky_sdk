// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library files_mojom;

import 'dart:async';

import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojom/mojo/files/directory.mojom.dart' as directory_mojom;
import 'package:mojom/mojo/files/types.mojom.dart' as types_mojom;


class FilesOpenFileSystemParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String fileSystem = null;
  Object directory = null;

  FilesOpenFileSystemParams() : super(kVersions.last.size);

  static FilesOpenFileSystemParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static FilesOpenFileSystemParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FilesOpenFileSystemParams result = new FilesOpenFileSystemParams();

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
      
      result.fileSystem = decoder0.decodeString(8, true);
    }
    if (mainDataHeader.version >= 0) {
      
      result.directory = decoder0.decodeInterfaceRequest(16, false, directory_mojom.DirectoryStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(fileSystem, 8, true);
    
    encoder0.encodeInterfaceRequest(directory, 16, false);
  }

  String toString() {
    return "FilesOpenFileSystemParams("
           "fileSystem: $fileSystem" ", "
           "directory: $directory" ")";
  }
}

class FilesOpenFileSystemResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int error = 0;

  FilesOpenFileSystemResponseParams() : super(kVersions.last.size);

  static FilesOpenFileSystemResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    decoder.excessHandles.forEach((h) => h.close());
    return result;
  }

  static FilesOpenFileSystemResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FilesOpenFileSystemResponseParams result = new FilesOpenFileSystemResponseParams();

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
      
      result.error = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInt32(error, 8);
  }

  String toString() {
    return "FilesOpenFileSystemResponseParams("
           "error: $error" ")";
  }
}

const int kFiles_openFileSystem_name = 0;

const String FilesName =
      'mojo::files::Files';

abstract class Files {
  Future<FilesOpenFileSystemResponseParams> openFileSystem(String fileSystem,Object directory,[Function responseFactory = null]);

}


class FilesProxyImpl extends bindings.Proxy {
  FilesProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  FilesProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  FilesProxyImpl.unbound() : super.unbound();

  static FilesProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For FilesProxyImpl"));
    return new FilesProxyImpl.fromEndpoint(endpoint);
  }

  String get name => FilesName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kFiles_openFileSystem_name:
        var r = FilesOpenFileSystemResponseParams.deserialize(
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
    return "FilesProxyImpl($superString)";
  }
}


class _FilesProxyCalls implements Files {
  FilesProxyImpl _proxyImpl;

  _FilesProxyCalls(this._proxyImpl);
    Future<FilesOpenFileSystemResponseParams> openFileSystem(String fileSystem,Object directory,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new FilesOpenFileSystemParams();
      params.fileSystem = fileSystem;
      params.directory = directory;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kFiles_openFileSystem_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class FilesProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Files ptr;
  final String name = FilesName;

  FilesProxy(FilesProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _FilesProxyCalls(proxyImpl);

  FilesProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new FilesProxyImpl.fromEndpoint(endpoint) {
    ptr = new _FilesProxyCalls(impl);
  }

  FilesProxy.fromHandle(core.MojoHandle handle) :
      impl = new FilesProxyImpl.fromHandle(handle) {
    ptr = new _FilesProxyCalls(impl);
  }

  FilesProxy.unbound() :
      impl = new FilesProxyImpl.unbound() {
    ptr = new _FilesProxyCalls(impl);
  }

  static FilesProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For FilesProxy"));
    return new FilesProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "FilesProxy($impl)";
  }
}


class FilesStub extends bindings.Stub {
  Files _impl = null;

  FilesStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  FilesStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  FilesStub.unbound() : super.unbound();

  static FilesStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For FilesStub"));
    return new FilesStub.fromEndpoint(endpoint);
  }

  static const String name = FilesName;


  FilesOpenFileSystemResponseParams _FilesOpenFileSystemResponseParamsFactory(int error) {
    var result = new FilesOpenFileSystemResponseParams();
    result.error = error;
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
      case kFiles_openFileSystem_name:
        var params = FilesOpenFileSystemParams.deserialize(
            message.payload);
        return _impl.openFileSystem(params.fileSystem,params.directory,_FilesOpenFileSystemResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kFiles_openFileSystem_name,
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

  Files get impl => _impl;
  set impl(Files d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "FilesStub($superString)";
  }

  int get version => 0;
}


