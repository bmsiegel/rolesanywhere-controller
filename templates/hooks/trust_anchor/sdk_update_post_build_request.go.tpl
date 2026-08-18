	// Sync enabled/disabled state after update (Enable/Disable are separate API calls)
	if desired.ko.Spec.Enabled != nil {
		desiredEnabled := *desired.ko.Spec.Enabled
		currentEnabled := true
		if latest.ko.Spec.Enabled != nil {
			currentEnabled = *latest.ko.Spec.Enabled
		}
		if desiredEnabled != currentEnabled {
			if desiredEnabled {
				_, err = rm.sdkapi.EnableTrustAnchor(ctx, &svcsdk.EnableTrustAnchorInput{
					TrustAnchorId: latest.ko.Status.TrustAnchorID,
				})
			} else {
				_, err = rm.sdkapi.DisableTrustAnchor(ctx, &svcsdk.DisableTrustAnchorInput{
					TrustAnchorId: latest.ko.Status.TrustAnchorID,
				})
			}
			if err != nil {
				return nil, err
			}
		}
	}
