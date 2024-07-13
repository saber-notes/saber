#!/bin/bash

# Remove `simulator` from pubspec.yaml
sed -i -e '/simulator/d' pubspec.yaml

# Delete `main_simulator.dart` entry point
rm lib/main_simulator.dart
