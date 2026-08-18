	// Sync enabled/disabled state after update (Enable/Disable are separate API calls)
	if desired.ko.Spec.Enabled != nil {
		desiredEnabled := *desired.ko.Spec.Enabled
		currentEnabled := true
		if latest.ko.Spec.Enabled != nil {
			currentEnabled = *latest.ko.Spec.Enabled
		}
		if desiredEnabled != currentEnabled {
			if desiredEnabled {
				_, err = rm.sdkapi.EnableProfile(ctx, &svcsdk.EnableProfileInput{
					ProfileId: latest.ko.Status.ProfileID,
				})
			} else {
				_, err = rm.sdkapi.DisableProfile(ctx, &svcsdk.DisableProfileInput{
					ProfileId: latest.ko.Status.ProfileID,
				})
			}
			if err != nil {
				return nil, err
			}
		}
	}
