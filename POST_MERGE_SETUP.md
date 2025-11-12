# Post-Merge Setup Instructions

After this PR is merged to the main branch, follow these steps to complete the GitHub Pages setup and make the demo live.

## Step 1: Enable GitHub Pages

1. Navigate to your repository on GitHub
2. Click on **Settings** (repository settings, not account settings)
3. Scroll down to find **Pages** in the left sidebar
4. Click on **Pages**

## Step 2: Configure GitHub Pages Source

1. Under **Build and deployment**:
   - **Source**: Select **"GitHub Actions"** from the dropdown
   - This is crucial! Do not select "Deploy from a branch"
2. Click **Save** if there's a save button

## Step 3: Trigger Initial Deployment

You have two options:

### Option A: Automatic (Recommended)
Wait for the next push to main, or make a small change and push to main. The workflow will trigger automatically.

### Option B: Manual Trigger
1. Go to the **Actions** tab
2. Click on **Deploy Demo to GitHub Pages** workflow
3. Click **Run workflow** button
4. Select `main` branch
5. Click **Run workflow**

## Step 4: Monitor Deployment

1. Go to the **Actions** tab
2. Watch the running workflow
3. The build typically takes 3-5 minutes
4. Wait for both "build" and "deploy" jobs to complete successfully
5. Look for a green checkmark ✓

## Step 5: Access the Demo

Once deployment is complete:

1. The demo will be available at:
   ```
   https://<username>.github.io/flutterish_pdf_viewer/
   ```
   Replace `<username>` with the GitHub username or organization name

2. You can also find the URL in:
   - Settings > Pages (will show the URL once deployed)
   - Actions tab > Click on the workflow run > Click "deploy" job > Look for the URL in the output

## Step 6: Update Links (Optional)

If the actual GitHub username differs from the assumed one in the documentation:

1. Update the demo URLs in:
   - `README.md`
   - `example/README.md`
   - `DEMO_FEATURES.md`
   - `GITHUB_PAGES_SETUP.md`

2. Commit and push the updates

## Step 7: Test the Live Demo

Visit the deployed demo and test:

- [ ] Home page loads correctly
- [ ] Navigation to demo pages works
- [ ] URL input and PDF loading works
- [ ] Custom controls example works
- [ ] Asset PDF example works (may need assets)
- [ ] Download functionality works (may vary by browser)
- [ ] Icons and favicon display correctly
- [ ] Responsive design on mobile devices

## Troubleshooting

### Demo Shows 404 Error

**Problem**: Page not found after deployment

**Solutions**:
1. Verify GitHub Pages is set to "GitHub Actions" source
2. Check that `.nojekyll` file exists in `example/web/`
3. Verify the workflow completed successfully
4. Wait a few minutes for DNS propagation
5. Clear browser cache and try again

### Workflow Fails to Build

**Problem**: GitHub Actions workflow fails

**Solutions**:
1. Check the Actions tab for error details
2. Verify all dependencies in `example/pubspec.yaml` are correct
3. Ensure Flutter version in workflow is compatible
4. Check for any syntax errors in `example/lib/main.dart`
5. Try running the build locally first: `./serve-demo.sh`

### Assets Not Loading

**Problem**: Icons or other assets show 404

**Solutions**:
1. Verify icon files exist in `example/web/icons/`
2. Check `manifest.json` paths are correct
3. Rebuild and redeploy
4. Check browser console for specific 404 errors

### Base URL Issues

**Problem**: Links or navigation not working

**Solutions**:
1. Verify base-href in workflow matches repository name
2. Check that repository name is `flutterish_pdf_viewer`
3. If using a different repo name, update workflow:
   ```yaml
   flutter build web --release --base-href /YOUR_REPO_NAME/
   ```

## Custom Domain (Optional)

To use a custom domain like `demo.example.com`:

1. Create a `CNAME` file in `example/web/`:
   ```
   demo.example.com
   ```

2. Update your domain's DNS settings:
   - Type: CNAME
   - Name: demo (or your subdomain)
   - Value: `<username>.github.io`

3. Update workflow to remove base-href restriction:
   ```yaml
   flutter build web --release --base-href /
   ```

4. In GitHub Settings > Pages, enter your custom domain
5. Wait for DNS propagation (can take up to 24 hours)
6. Enable HTTPS in Pages settings

## Monitoring

Keep an eye on:

- **Actions tab**: For deployment status
- **Insights > Traffic**: For visitor analytics (if enabled)
- **Issues**: For user-reported problems with the demo

## Maintenance

Regular tasks:

- Update Flutter version in workflow as needed
- Keep dependencies up to date
- Monitor for security advisories
- Test demo after major library updates
- Update demo features as library evolves

## Success Indicators

Your demo is successfully deployed when:

✅ GitHub Actions workflow completes without errors  
✅ Demo URL loads and shows the home page  
✅ All navigation works correctly  
✅ PDFs can be loaded from URLs  
✅ All demo pages are accessible  
✅ No console errors in browser developer tools  
✅ Icons and favicon display properly  
✅ Mobile view is responsive  

## Getting Help

If you encounter issues:

1. Check the troubleshooting section above
2. Review the Actions workflow logs
3. Test the build locally with `./serve-demo.sh`
4. Open an issue in the repository
5. Check GitHub Pages documentation: https://docs.github.com/pages

## Next Steps

After successful deployment:

- Share the demo link on social media
- Add a badge to README showing demo status
- Consider analytics integration
- Gather user feedback
- Plan future demo enhancements

---

**Remember**: The demo will automatically redeploy whenever changes are pushed to the main branch, so future updates are easy!
