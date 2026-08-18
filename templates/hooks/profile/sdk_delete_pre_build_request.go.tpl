	// Disable profile before deletion (API requirement)
	if r.ko.Spec.Enabled == nil || *r.ko.Spec.Enabled {
		_, _ = rm.sdkapi.DisableProfile(ctx, &svcsdk.DisableProfileInput{
			ProfileId: r.ko.Status.ProfileID,
		})
	}
