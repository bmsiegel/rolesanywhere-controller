	// Disable trust anchor before deletion (API requirement)
	if r.ko.Spec.Enabled == nil || *r.ko.Spec.Enabled {
		_, _ = rm.sdkapi.DisableTrustAnchor(ctx, &svcsdk.DisableTrustAnchorInput{
			TrustAnchorId: r.ko.Status.TrustAnchorID,
		})
	}
