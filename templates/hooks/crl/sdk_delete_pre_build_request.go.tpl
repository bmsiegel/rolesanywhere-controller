	// Disable CRL before deletion (API requirement)
	if r.ko.Spec.Enabled == nil || *r.ko.Spec.Enabled {
		_, _ = rm.sdkapi.DisableCrlWithContext(ctx, &svcsdk.DisableCrlInput{
			CrlId: r.ko.Status.CRLID,
		})
	}
