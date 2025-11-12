# GitHub Pages Setup Guide

This guide explains how to set up GitHub Pages for the Flutterish PDF Viewer demo.

## Prerequisites

- Repository admin access
- GitHub Actions enabled in the repository

## Setup Steps

### 1. Enable GitHub Pages

1. Go to your repository on GitHub
2. Navigate to **Settings** > **Pages**
3. Under **Build and deployment**:
   - **Source**: Select "GitHub Actions"
4. Save the changes

### 2. Workflow Configuration

The workflow file is already created at `.github/workflows/deploy-demo.yml`.

This workflow:
- Triggers on push to `main` branch
- Can also be triggered manually via workflow_dispatch
- Builds the Flutter web app
- Deploys to GitHub Pages

### 3. Base URL Configuration

The workflow is configured with the base href `/flutterish_pdf_viewer/` which matches the repository name. If your repository has a different name, update this in `.github/workflows/deploy-demo.yml`:

```yaml
flutter build web --release --base-href /YOUR_REPO_NAME/
```

### 4. Custom Domain (Optional)

To use a custom domain:

1. Create a file `example/web/CNAME` with your domain:
   ```
   demo.yourdomain.com
   ```

2. Configure DNS with your domain provider:
   - Add a CNAME record pointing to `yourusername.github.io`

3. Update the base href in the workflow:
   ```yaml
   flutter build web --release --base-href /
   ```

## Deployment

### Automatic Deployment

Every push to the `main` branch will automatically trigger a deployment.

### Manual Deployment

You can manually trigger deployment:

1. Go to **Actions** tab
2. Select **Deploy Demo to GitHub Pages** workflow
3. Click **Run workflow**
4. Select the branch and click **Run workflow**

## Accessing the Demo

After successful deployment, your demo will be available at:

```
https://yourusername.github.io/flutterish_pdf_viewer/
```

Replace `yourusername` with your GitHub username or organization name.

## Troubleshooting

### Build Fails

- Check the Actions tab for error logs
- Ensure all dependencies in `example/pubspec.yaml` are correct
- Verify Flutter version compatibility

### 404 Error on Deployment

- Ensure GitHub Pages is configured to use "GitHub Actions" as source
- Check that the base href matches your repository name
- Verify the `.nojekyll` file exists in `example/web/`

### Icons Not Loading

- Ensure icon files exist in `example/web/icons/`
- Check browser console for 404 errors
- Verify manifest.json references correct icon paths

## Local Testing

Test the web build locally before deploying:

### Quick Start (Unix/macOS/Linux)

Use the provided script:

```bash
./serve-demo.sh
```

This will build and serve the demo at `http://localhost:8000`.

### Manual Build and Serve

```bash
cd example
flutter build web --release
python3 -m http.server 8000 -d build/web
```

Then open `http://localhost:8000` in your browser.

## Updating the Demo

To update the demo:

1. Make changes to the example app in `example/lib/`
2. Commit and push to `main` branch
3. GitHub Actions will automatically rebuild and redeploy

## Performance Tips

- Keep assets optimized (compress images, minimize files)
- Use lazy loading for heavy resources
- Consider code splitting for larger apps
- Enable caching in service worker

## Security

The workflow uses the following permissions:
- `contents: read` - Read repository content
- `pages: write` - Deploy to GitHub Pages
- `id-token: write` - Required for deployment

These are minimal required permissions for GitHub Pages deployment.
