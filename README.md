# flutterish_pdf_viewer
A PDF viewer in flutter that does not require any external native dependencies

## GitHub Pages Deployment

This repository includes a GitHub Actions workflow that automatically builds and deploys the Flutter web application to GitHub Pages.

### Setup Instructions

To enable GitHub Pages deployment:

1. Go to your repository **Settings** > **Pages**
2. Under **Source**, select **GitHub Actions**
3. The workflow will automatically deploy on pushes to the `main` or `master` branch

The application will be available at: `https://evaisse.github.io/flutterish_pdf_viewer/`

### Manual Deployment

You can also trigger a manual deployment:

1. Go to **Actions** tab in your repository
2. Select the **Deploy Flutter Web to GitHub Pages** workflow
3. Click **Run workflow**
