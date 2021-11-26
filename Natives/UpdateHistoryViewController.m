#import "UpdateHistoryViewController.h"

#include "utils.h"

#if CONFIG_RELEASE == 1
# define CONFIG_TYPE "release"
#else
# define CONFIG_TYPE "debug"
#endif

@interface UpdateHistoryViewController () {
}
@end

@implementation UpdateHistoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    viewController = self;
    
    [self setTitle:@"Update History"];

    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenScale = [[UIScreen mainScreen] scale];

    int width = (int) roundf(screenBounds.size.width);
    int height = (int) roundf(screenBounds.size.height) - self.navigationController.navigationBar.frame.size.height;
    int rawHeight = (int) roundf(screenBounds.size.height);

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, rawHeight)];
    [self.view addSubview:scrollView];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;

    // Update color mode once
    if(@available(iOS 13.0, *)) {
        [self traitCollectionDidChange:nil];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }

    UILabel *latestVerNote = [[UILabel alloc] initWithFrame:CGRectMake(4.0, 4.0, scrollView.frame.size.width - 4, 30.0)];
    latestVerNote.text = @"Current version";
    latestVerNote.lineBreakMode = NSLineBreakByWordWrapping;
    latestVerNote.numberOfLines = 0;
    [scrollView addSubview:latestVerNote];
    [latestVerNote setFont:[UIFont boldSystemFontOfSize:25]];

    UILabel *latestVerView = [[UILabel alloc] initWithFrame:CGRectMake(4.0, latestVerNote.frame.origin.y + latestVerNote.frame.size.height, scrollView.frame.size.width - 4, 30.0)];
    latestVerView.text = [NSString stringWithFormat:@"2.1 (%s)", CONFIG_TYPE];
    latestVerView.lineBreakMode = NSLineBreakByWordWrapping;
    latestVerView.numberOfLines = 0;
    [scrollView addSubview:latestVerView];
    [latestVerView setFont:[UIFont boldSystemFontOfSize:20]];

    UILabel *latestVerChanges = [[UILabel alloc] initWithFrame:CGRectMake(4.0, latestVerView.frame.origin.y + latestVerView.frame.size.height, scrollView.frame.size.width - 4, 30.00)];
    latestVerChanges.text = @"Changes";
    latestVerChanges.numberOfLines = 0;
    [scrollView addSubview:latestVerChanges];
    [latestVerChanges setFont:[UIFont boldSystemFontOfSize:17]];

    UILabel *latestVerChangesCont = [[UILabel alloc] initWithFrame:CGRectMake(4.0, latestVerChanges.frame.origin.y + latestVerChanges.frame.size.height, scrollView.frame.size.width - 4, 30.00)];
    latestVerChangesCont.text = @"- Various bug fixes";
    latestVerChangesCont.numberOfLines = 0;
    [latestVerChangesCont sizeToFit];
    [scrollView addSubview:latestVerChangesCont];

    UILabel *latestVerFixes = [[UILabel alloc] initWithFrame:CGRectMake(4.0, latestVerChangesCont.frame.origin.y + latestVerChangesCont.frame.size.height + 5.0, scrollView.frame.size.width - 4, 30.00)];
    latestVerFixes.text = @"Fixes";
    latestVerFixes.numberOfLines = 0;
    [scrollView addSubview:latestVerFixes];
    [latestVerFixes setFont:[UIFont boldSystemFontOfSize:17]];

    UILabel *latestVerFixesCont = [[UILabel alloc] initWithFrame:CGRectMake(4.0, latestVerFixes.frame.origin.y + latestVerFixes.frame.size.height, scrollView.frame.size.width - 4, 30.00)];
    latestVerFixesCont.text = @"- Custom controls page is now complete";
    latestVerFixesCont.numberOfLines = 0;
    [latestVerFixesCont sizeToFit];
    [scrollView addSubview:latestVerFixesCont];

    UILabel *latestVerIssues = [[UILabel alloc] initWithFrame:CGRectMake(4.0, latestVerFixesCont.frame.origin.y + latestVerFixesCont.frame.size.height + 5.0, scrollView.frame.size.width - 4, 30.00)];
    latestVerIssues.text = @"Issues";
    latestVerIssues.numberOfLines = 0;
    [scrollView addSubview:latestVerIssues];
    [latestVerIssues setFont:[UIFont boldSystemFontOfSize:17]];

    UILabel *latestVerIssuesCont = [[UILabel alloc] initWithFrame:CGRectMake(4.0, latestVerIssues.frame.origin.y + latestVerIssues.frame.size.height, scrollView.frame.size.width - 4, 30.00)];
    latestVerIssuesCont.text = @"- Crash if login to Microsoft fails\n"
                               "- Old custom control .json files no longer work, remove to fix\n"
                               "- An unknown issue might cause Taurine, 14.3, and A12+ to crash on launch.";
    latestVerIssuesCont.numberOfLines = 0;
    [latestVerIssuesCont sizeToFit];
    [scrollView addSubview:latestVerIssuesCont];

    UILabel *prevVerNote = [[UILabel alloc] initWithFrame:CGRectMake(4.0, latestVerIssuesCont.frame.origin.y + latestVerIssuesCont.frame.size.height + 10.0, scrollView.frame.size.width - 4, 30.0)];
    prevVerNote.text = @"Previous versions";
    prevVerNote.lineBreakMode = NSLineBreakByWordWrapping;
    prevVerNote.numberOfLines = 0;
    [scrollView addSubview:prevVerNote];
    [prevVerNote setFont:[UIFont boldSystemFontOfSize:25]];

    UILabel *backOneVerView = [[UILabel alloc] initWithFrame:CGRectMake(4.0, prevVerNote.frame.origin.y + prevVerNote.frame.size.height, scrollView.frame.size.width - 4, 30.0)];
    backOneVerView.text = @"2.0 - Raw Iron";
    backOneVerView.lineBreakMode = NSLineBreakByWordWrapping;
    backOneVerView.numberOfLines = 0;
    [scrollView addSubview:backOneVerView];
    [backOneVerView setFont:[UIFont boldSystemFontOfSize:20]];

    UILabel *backOneVerChanges = [[UILabel alloc] initWithFrame:CGRectMake(4.0, backOneVerView.frame.origin.y + backOneVerView.frame.size.height, scrollView.frame.size.width - 4, 30.00)];
    backOneVerChanges.text = @"Changes";
    backOneVerChanges.numberOfLines = 0;
    [scrollView addSubview:backOneVerChanges];
    [backOneVerChanges setFont:[UIFont boldSystemFontOfSize:17]];


    UILabel *backOneVerChangesCont = [[UILabel alloc] initWithFrame:CGRectMake(4.0, backOneVerChanges.frame.origin.y + backOneVerChanges.frame.size.height, scrollView.frame.size.width - 4, 30.00)];
    backOneVerChangesCont.text = @"- The Login view has been simplified to three easy buttons\n"
                                 "- The Offline Account has been replaced with Local Account. Installing Minecraft now requires a Mojang or Microsoft account logged in.\n"
                                 "- New FAQ page to show quick answers to questions\n"
                                 "- New About view to show quick details, links, and update history\n"
                                 "- Ability to send logs from within the launcher\n"
                                 "- The Select Account screen is now a pop-up window\n"
                                 "- New picker view to switch versions without typing them manually\n"
                                 "- Support to show your locally installed clients\n"
                                 "- New settings page to manage preferences\n"
                                 "- OpenJDK 8 support, to allow older versions of modded Minecraft\n"
                                 "- New mod installer, built into the launcher\n"
                                 "- Unfinished in-launcher custom controls\n"
                                 "- Move to /usr/share, for better rootFS compatibility\n"
                                 "- New packaging format\n"
                                 "   - release, for iOS 14 and lower (full root access jailbreaks)\n"
                                 "   - release-rootless, for iOS 15 (Procursus rootless jailbreak)";
    backOneVerChangesCont.numberOfLines = 0;
    [backOneVerChangesCont sizeToFit];
    [scrollView addSubview:backOneVerChangesCont];

    UILabel *backOneVerFixes = [[UILabel alloc] initWithFrame:CGRectMake(4.0, backOneVerChangesCont.frame.origin.y + backOneVerChangesCont.frame.size.height + 5.0, scrollView.frame.size.width - 4, 30.00)];
    backOneVerFixes.text = @"Fixes";
    backOneVerFixes.numberOfLines = 0;
    [scrollView addSubview:backOneVerFixes];
    [backOneVerFixes setFont:[UIFont boldSystemFontOfSize:17]];

    UILabel *backOneVerFixesCont = [[UILabel alloc] initWithFrame:CGRectMake(4.0, backOneVerFixes.frame.origin.y + backOneVerFixes.frame.size.height, scrollView.frame.size.width - 4, 30.00)];
    backOneVerFixesCont.text = @"- WIP fix for typing on 1.12.2 and older\n"
                               "- The hotbar now works across GUI scales\n"
                               "- (With JDK 8) Forge 1.8.9 - 1.15.2 now work\n"
                               "- (With JDK 8) Vanilla 1.5.2 and under now work\n"
                               "- Buttons now scale correctly according to screen size";
    backOneVerFixesCont.numberOfLines = 0;
    [backOneVerFixesCont sizeToFit];
    [scrollView addSubview:backOneVerFixesCont];

    UILabel *backOneVerIssues = [[UILabel alloc] initWithFrame:CGRectMake(4.0, backOneVerFixesCont.frame.origin.y + backOneVerFixesCont.frame.size.height + 5.0, scrollView.frame.size.width - 4, 30.00)];
    backOneVerIssues.text = @"Issues";
    backOneVerIssues.numberOfLines = 0;
    [scrollView addSubview:backOneVerIssues];
    [backOneVerIssues setFont:[UIFont boldSystemFontOfSize:17]];

    UILabel *backOneVerIssuesCont = [[UILabel alloc] initWithFrame:CGRectMake(4.0, backOneVerIssues.frame.origin.y + backOneVerIssues.frame.size.height, scrollView.frame.size.width - 4, 30.00)];
    backOneVerIssuesCont.text = @"- Crash if login to Microsoft fails\n"
                                "- Old custom control .json files no longer work, remove to fix\n"
                                "- Custom controls settings page is not complete, there may be some issues!\n"
                                "- An unknown issue might cause Taurine, 14.3, and A12+ to crash on launch.";
    backOneVerIssuesCont.numberOfLines = 0;
    [backOneVerIssuesCont sizeToFit];
    [scrollView addSubview:backOneVerIssuesCont];

    UILabel *backTwoVerView = [[UILabel alloc] initWithFrame:CGRectMake(4.0, backOneVerIssuesCont.frame.origin.y + backOneVerIssuesCont.frame.size.height + 20.0, scrollView.frame.size.width - 4, 30.0)];
    backTwoVerView.text = @"1.2";
    backTwoVerView.lineBreakMode = NSLineBreakByWordWrapping;
    backTwoVerView.numberOfLines = 0;
    [scrollView addSubview:backTwoVerView];
    [backTwoVerView setFont:[UIFont boldSystemFontOfSize:20]];

    UILabel *backTwoVerChanges = [[UILabel alloc] initWithFrame:CGRectMake(4.0, backTwoVerView.frame.origin.y + backTwoVerView.frame.size.height, scrollView.frame.size.width - 4, 30.00)];
    backTwoVerChanges.text = @"Changes";
    backTwoVerChanges.numberOfLines = 0;
    [scrollView addSubview:backTwoVerChanges];
    [backTwoVerChanges setFont:[UIFont boldSystemFontOfSize:17]];


    UILabel *backTwoVerChangesCont = [[UILabel alloc] initWithFrame:CGRectMake(4.0, backTwoVerChanges.frame.origin.y + backTwoVerChanges.frame.size.height, scrollView.frame.size.width - 4, 30.00)];
    backTwoVerChangesCont.text = @"- Use new method for Microsoft login\n"
                                 "- Added gl4es 1.1.5 as an option\n"
                                 "- WIP custom controls (can be changed by placing at /var/mobile/Documents/.pojavlauncher/controlmap/default.json). Note that some functions may not work properly.\n"
                                 "- WIP external mouse support\n"
                                 "- Custom environment variables, in /var/mobile/Documents/.pojavlauncher/custom_env.txt\n"
                                 "- Reduction of file size with removal of unused binaries\n"
                                 "- Moved latestlog.txt and overrideargs.txt to /var/mobile/Documents/.pojavlauncher";
    backTwoVerChangesCont.numberOfLines = 0;
    [backTwoVerChangesCont sizeToFit];
    [scrollView addSubview:backTwoVerChangesCont];

    UILabel *backTwoVerFixes = [[UILabel alloc] initWithFrame:CGRectMake(4.0, backTwoVerChangesCont.frame.origin.y + backTwoVerChangesCont.frame.size.height + 5.0, scrollView.frame.size.width - 4, 30.00)];
    backTwoVerFixes.text = @"Fixes";
    backTwoVerFixes.numberOfLines = 0;
    [scrollView addSubview:backTwoVerFixes];
    [backTwoVerFixes setFont:[UIFont boldSystemFontOfSize:17]];

    UILabel *backTwoVerFixesCont = [[UILabel alloc] initWithFrame:CGRectMake(4.0, backTwoVerFixes.frame.origin.y + backTwoVerFixes.frame.size.height, scrollView.frame.size.width - 4, 30.00)];
    backTwoVerFixesCont.text = @"- Fix file permission issues during install of package\n"
                               "- Hide home bar like Bedrock Edition\n"
                               "- Properly hide iPad status bar";
    backTwoVerFixesCont.numberOfLines = 0;
    [backTwoVerFixesCont sizeToFit];
    [scrollView addSubview:backTwoVerFixesCont];

    UILabel *backTwoVerIssues = [[UILabel alloc] initWithFrame:CGRectMake(4.0, backTwoVerFixesCont.frame.origin.y + backTwoVerFixesCont.frame.size.height + 5.0, scrollView.frame.size.width - 4, 30.00)];
    backTwoVerIssues.text = @"Issues";
    backTwoVerIssues.numberOfLines = 0;
    [scrollView addSubview:backTwoVerIssues];
    [backTwoVerIssues setFont:[UIFont boldSystemFontOfSize:17]];

    UILabel *backTwoVerIssuesCont = [[UILabel alloc] initWithFrame:CGRectMake(4.0, backTwoVerIssues.frame.origin.y + backTwoVerIssues.frame.size.height, scrollView.frame.size.width - 4, 30.00)];
    backTwoVerIssuesCont.text = @"- Crash if login to Microsoft fails\n"
                                "- Several Forge versions won’t work due to removed deprecated classes (see #67 and #68)\n"
                                "- Control buttons notch offset seems doubled\n"
                                "- Text input will not work on 1.12.2 and below";
    backTwoVerIssuesCont.numberOfLines = 0;
    [backTwoVerIssuesCont sizeToFit];
    [scrollView addSubview:backTwoVerIssuesCont];

    UILabel *backMoreVerView = [[UILabel alloc] initWithFrame:CGRectMake(4.0, backTwoVerIssuesCont.frame.origin.y + backTwoVerIssuesCont.frame.size.height, scrollView.frame.size.width - 4, 30.00)];
    backMoreVerView.text = @"See the GitHub for even earlier releases";
    backMoreVerView.numberOfLines = 0;
    [scrollView addSubview:backMoreVerView];
    [backMoreVerView setFont:[UIFont boldSystemFontOfSize:20]];

    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, backMoreVerView.frame.origin.y + backMoreVerView.frame.size.height);

}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    if(@available(iOS 13.0, *)) {
        if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            self.view.backgroundColor = [UIColor blackColor];
        } else {
            self.view.backgroundColor = [UIColor whiteColor];
        }
    }
}

@end
