# Contributing to flutterish_pdf_viewer

Thank you for your interest in contributing to flutterish_pdf_viewer! This document provides guidelines for contributing to the project.

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR_USERNAME/flutterish_pdf_viewer.git`
3. Create a branch: `git checkout -b feature/your-feature-name`

## Development Setup

1. Ensure you have Flutter installed: https://flutter.dev/docs/get-started/install
2. Install dependencies:
   ```bash
   flutter pub get
   cd example && flutter pub get
   ```

## Making Changes

1. Make your changes in the appropriate files
2. Follow the existing code style
3. Add tests for new functionality
4. Update documentation as needed
5. Run tests: `flutter test`
6. Run the example app: `cd example && flutter run`

## Pull Request Process

1. Update the README.md with details of changes if applicable
2. Update the CHANGELOG.md with your changes
3. Ensure all tests pass
4. Create a pull request with a clear title and description

## Code Style

- Follow the [Dart style guide](https://dart.dev/guides/language/effective-dart/style)
- Use meaningful variable and function names
- Add comments for complex logic
- Keep functions small and focused

## Testing

- Write unit tests for new functionality
- Ensure existing tests still pass
- Aim for good test coverage

## Documentation

- Update README.md for user-facing changes
- Add dartdoc comments to public APIs
- Include examples in documentation

## Areas for Contribution

Here are some areas where contributions would be particularly valuable:

1. **PDF Parsing**: Implement a pure Dart PDF parser to read PDF structure
2. **PDF Rendering**: Add rendering capabilities for displaying actual PDF content
3. **Performance**: Optimize loading and rendering for large PDFs
4. **Features**:
   - Zoom and pan functionality
   - Text selection and search
   - Annotations support
   - Form filling
   - Multi-page thumbnail view
5. **Platform Support**: Ensure compatibility across all Flutter platforms
6. **Testing**: Expand test coverage
7. **Documentation**: Improve examples and guides

## Questions?

Feel free to open an issue for questions or discussions.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
